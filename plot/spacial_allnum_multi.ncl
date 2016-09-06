; ===========================================
; hov.ncl
; ===========================================
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
;load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
;load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
; ===========================================
begin
;f    = addfile("pixelxy_numyr86yr05.nc", "r")
f    = addfile("../data/pixel_yr86yr05monthly_allnum.nc","r")
invar0  = f->numb(:,:,:)
invar1  = f->temp(:,:,:)
invar2  = f->dura(:,:,:)
invar3  = f->size(:,:,:)
invar1@_FillValue = -999.0
invar2@_FillValue = -999.0
invar3@_FillValue = -999.0
;calculate variables per month, peryear
var0 = dim_sum_n_Wrap(invar0,0)
print(var0(1,1))
var1 = dim_sum_n_Wrap(invar1,0)
var2 = dim_sum_n_Wrap(invar2,0)
var3 = dim_sum_n_Wrap(invar3,0)

var1 = var1*1/var0
var2 = var2*1/var0
var3 = var3*1/var0
var0 = var0/20
;time  =  cd_calendar(f->time,-1)
;print (var&lon)
;==============================================
; create color plot
;=============================================
wks  = gsn_open_wks ("pdf", "../fig/spa_multi_allnum" )            ; open ps file
;gsn_define_colormap(wks,"BlWhRe")              ; choose colormap

plot = new(4,graphic)
res                      = True                ; plot mods desired
res@cnFillOn             = True               ; turn on color fill
res@cnLinesOn           = False              ; turn on color fill
;res@cnFillPalette       = "BlueRedGray" ; set color map
res@cnFillPalette         = "BlAqGrYeOrRe"
;---------------- modulate details -----------------------
res@tiMainFont    = "helvetica" 
res@gsnStringFont = "helvetica"
res@tmXBLabelFont = "helvetica"
res@tmYLLabelFont = "helvetica"

res@mpMinLatF           = -30
res@mpMaxLatF           = 30
res@mpCenterLonF        = 180
res@mpMinLonF           = 0
res@mpMaxLonF           = 360
;res@gsnSpreadColors      = True               ; use full range of colors
;res@cnLevelSelectionMode = "ManualLevels"     ; manual contour levels
;res@cnMinLevelValF       = -100.               ; min level
;res@cnMaxLevelValF       =  100.               ; max level
;res@cnLevelSpacingF      = 20.                 ; contour level spacing

res@lbOrientation        = "vertical"
res@lbLabelFont          = "helvetica"
;res@lbLabelFontHeightF   = 0.02

;res@tiYAxisString = "Year"
res@tiYAxisFont   = "helvetica"
;-----------------------plot-----------------------------
;res@tiMainString  = "at -45~S~o~N~S"                  ; main title
plot(0) = gsn_csm_contour_map(wks, var0({-30:30},{0:1080}), res) 
plot(1) = gsn_csm_contour_map(wks, var1({-30:30},{0:1080}), res) 
plot(2) = gsn_csm_contour_map(wks, var2({-30:30},{0:1080}), res) 
plot(3) = gsn_csm_contour_map(wks, var3({-30:30},{0:1080}), res) 

Pres                 = True
;Pres@gsnMaximize      = True

Pres@mpMinLatF           = -30
Pres@mpMaxLatF           = 30
Pres@mpCenterLonF        = 180
Pres@mpMinLonF           = 0
Pres@mpMaxLonF           = 360

gsn_panel(wks,plot,(/4,1/),Pres)
end
