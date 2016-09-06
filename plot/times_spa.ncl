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
;f    = addfile("../data/pixel_yr86yr05monthly.nc","r")
f    = addfile("../data/num_init_yr86yr05monthly.nc","r")
;invar  = f->numb(:,:,:)  
invar  = f->num_cent(:,:,:)  
;invar@_FillValue = -999.0 
;var = dim_avg_n_Wrap(invar,0)
var = dim_sum_n_Wrap(invar,(/1,2/))
var0 =dim_sum_n(invar,(/1,2/)) 

dimDate = dimsizes(var&time)
dateF   = new (dimDate,float)   ; convert integer YYYYMM to float
do n=0,dimDate-1       
   yyyy      = var&time(n)/100 
   mon       = var&time(n)-yyyy*100
   dateF(n) = yyyy + (mon-1)/12.  
end do
;print (dateF)
;=================================================;
wks  = gsn_open_wks("pdf","../fig/times_num_exp3_global")   ; send graphics to PNG file

res                     = True          ; plot mods desired
;res@gsnMaximize         = True          ; maximize plot size
;res@xyLineThicknesses = (/  1.0,   2.0/)          ; make second line thicker
;res@xyLineColors      = (/"blue","red"/)          ; change line color
res@xyLineThicknesses = (/2.0/)          ; make second line thicker
res@xyLineColor      = (/"black"/)          ; change line color
;res@xyMarkers      = (/6,11,16/)               ; 3 different markers
;res@xyMarkerColors := (/"blue","red","green"/) ; 3 different colors
res@xyMarker      = (/16/)               ; 3 different markers
res@xyMarkerColor = (/"blue"/) ; 3 different colors
;plot = gsn_csm_xy(wks,var&time,var,res)       ; contour the variable
;plot = gsn_csm_xy(wks,dateF,var,res)       ; contour the variable

;x     = ispan(1,240,1)
x     = fspan(1986,2005,240)
;res@tmXBMode          = "Explicit"              ; explicit labels
;res@tmXBValues        = (/1986,1987,1988,1999,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005/)                       ; location of labels 
;res@tmXBMode        = "Manual"    
;res@tmXBTickStartF  = 1986 
;res@tmXBTickEndF    = 2005
;res@tmXBTickSpacingF= 5
;res@gsnLeftString   = "tmXBMode = Manual"

plot = gsn_csm_xy(wks,x,var0,res)       ; contour the variable
end
