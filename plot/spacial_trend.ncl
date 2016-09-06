;================================================;
;
;Plot spacial distribution  of MCS numbers
;
;================================================;
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"   
;load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
;load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
; ================================================;
begin
;=================================================;
; open file and read in data
;=================================================;
;f    = addfile("../data/num_init_yr86yr05monthly.nc","r")
f    = addfile("../data/pixel_yr86yr05monthly.nc","r")
;var  = f->numb(:,:)                
;var = var/20.            ;number of each year
;var  = f->numb(1,:,:)                
;tmp  = f->num_init(:,:,:)  
tmp  = f->numb(:,:,:)  
;invar@_FillValue = -999.0 
ts   = tmp(lat|:,lon|:,time|:)               ; reorder variable
delete(tmp)
;var@_FillValue = -999.0 
;=================================================;
time = ts&time
rc           = regCoef(time,ts)             
rc@long_name = "regression coefficient (trend)"
rc@units     = ts@units+"/month"    
copy_VarCoords(ts(:,:,0), rc)                ; copy lat,lon coords

wks  = gsn_open_wks("pdf","../fig/space_num_density_trend")   ; send graphics to PNG file

res                     = True          ; plot mods desired
res@cnLinesOn           = False
res@cnFillOn            = True          ; turn on color
res@cnFillPalette       = "BlueRedGray" ; set color map
;res@cnFillPalette         = "BlAqGrYeOrRe"

;res@vpWidthF            = 0.5           ; change aspect ratio of plot
;res@vpHeightF           = 0.3

;res@gsnMaximize         = True          ; maximize plot size

res@mpMinLatF           = -30
res@mpMaxLatF           = 30
res@mpCenterLonF    = 180
res@mpMinLonF           = 0
res@mpMaxLonF           = 360
plot = gsn_csm_contour_map(wks,rc,res)       ; contour the variable

end
