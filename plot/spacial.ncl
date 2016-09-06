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
;f    = addfile("data/pixelxy_numyr86yr05.nc","r")
;f    = addfile("data/pixelxy_numyr86yr05monthly.nc","r")
;f    = addfile("..data/pixel_yr86yr05monthly.nc","r")
f    = addfile("../data/num_init_yr86yr05monthly_exp4.nc","r")
;var  = f->numb(:,:)                
;var = var/20.            ;number of each year
;var  = f->numb(1,:,:)                
invar  = f->num_init(:,:,:)  
;invar@_FillValue = -999.0 
var = dim_avg_n_Wrap(invar,0)
var = 12*var
;var@_FillValue = -999.0 
;=================================================;
wks  = gsn_open_wks("pdf","../fig/space_num_init_avg_exp4")   ; send graphics to PNG file

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
plot = gsn_csm_contour_map(wks,var({-30:30},{0:1080}),res)       ; contour the variable

end
