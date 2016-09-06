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
f    = addfile("../data/ERA/w500.nc","r")
;time  =  cd_calendar(f->time(33603),-3)  ;4384--1986010100,33603--2005123118
;print (time)
;invar  = f->w(4384:33603,{-30:30},:)  
invar  = f->w(34,{-30:30},:)  
;var@_FillValue = -32767
;invar@scale_factor = 0.000297977259548624 
;invar@add_offset = -3.81310484495302 
;invar@_FillValue = -32767s 
;invar@missing_value = -32767s 

;var = dim_avg_n_Wrap(invar,0)
var = invar
;=================================================;
wks  = gsn_open_wks("pdf","../fig/w500_space_ex")   ; send graphics to PNG file

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
plot = gsn_csm_contour_map(wks,var,res)       ; contour the variable

end
