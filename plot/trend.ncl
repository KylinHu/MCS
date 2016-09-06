;*************************************************
; regress_2.ncl
;
; Concepts illustrated:
;   - Calculating the regression coefficient (slope) at each grid point   
;   - Copying attributes from one variable to another
;   - Drawing color-filled contours over a cylindrical equidistant map
;
;*************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

begin
;************************************************
; create pointer to file and read in temperature
;************************************************
diri = "/home/hxm_stu/WORK1/hcq/MCS/data/GPCP/2.2/"
fili = "precip.mon.mean.nc"
;diri = "/home/hxm_stu/WORK1/hcq/MCS/data/"
;fili = "num_init_yr86yr05monthly.nc"
in  = addfile(diri+fili,"r") 

;tmp  = in->precip(54:371,{-30:30},:)              ; 197901-201510,timestep 442
tmp  = in->precip(54:371,{-30:30},:)              ; 197901-201510,timestep 442
ts   = tmp(lat|:,lon|:,time|:)               ; reorder variable

delete(tmp)                                  ; no longer needed

;************************************************
; create x and calculate the regression coefficients (slopes, trends)    
;************************************************
time         = ts&time                       ; days since 1850-01-01
print(time)
rc           = regCoef(time,ts)             
                           
rc@long_name = "regression coefficient (trend)"
rc@units     = ts@units+"/month"    
copy_VarCoords(ts(:,:,0), rc)                ; copy lat,lon coords

;************************************************
; for illustration: change units to Pa/year
;************************************************

;rc           = rc*365                   ; (Pa/day)*(365_day/year)
;rc@units     = "mm/year"

;************************************************
; plotting parameters 
;************************************************
wks  = gsn_open_wks("pdf" ,"../fig/precip_regress_gpcp2.2") 
;gsn_define_colormap(wks,"ViBlGrWhYeOrRe")    ; choose colormap
gsn_define_colormap(wks,"BlueRedGray")    ; choose colormap
                                                   
res                       = True     
;res@gsnMaximize           = True             ; make large

res@cnFillOn              = True             ; turn on color
res@cnLinesOn             = False            ; turn off contour lines
res@cnLineLabelsOn        = False            ; turn off contour line labels
;;res@cnFillMode            = "RasterFill"

;res@cnLevelSelectionMode  = "ManualLevels"   ; set manual contour levels
;res@cnMinLevelValF        =  -1.00           ; set min contour level
;res@cnMaxLevelValF        =   1.00           ; set max contour level
;res@cnLevelSpacingF       =   0.10           ; set contour interval

res@mpFillOn              = False            ; turn off default background gray
;res@mpCenterLonF          = 210
res@mpMinLatF           = -30
res@mpMaxLatF           = 30
res@mpCenterLonF    = 180
res@mpMinLonF           = 0
res@mpMaxLonF           = 360
                                                                                        
res@tiMainString          = fili
plot = gsn_csm_contour_map_ce(wks,rc,res)    
end
