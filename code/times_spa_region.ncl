;================================================;
;
;to get regional num data
;
;================================================;
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
; ================================================;
begin
;=================================================;
; open file and read in data
;=================================================;
;f    = addfile("../data/pixel_yr86yr05monthly.nc","r")
;f    = addfile("../data/num_init_yr86yr05monthly.nc","r")
f    = addfile("../data/num_max_yr86yr05monthly_exp3.nc","r")
b    = addfile("../data/landsea.nc","r")
;invar  = f->numb(:,:,:)  
invar  = f->num_cent(:,:,:)  
time  = invar&time 
;invar@_FillValue = -999.0 

;-----------------regional---------------
;--North,South Hemisphere
invarN = invar(:,{0:30},:)  
invarS = invar(:,{-30:0},:)  
;--Land,Sea
lsm_var = landsea_mask(b->LSMASK,invar&lat,invar&lon)
invarLand = mask(invar,lsm_var.eq.0,False) ;mask out ocean points
invarSea  = mask(invar,lsm_var.eq.1,False) ;
copy_VarMeta(invar,invarLand)
copy_VarMeta(invar,invarSea)
;--Diff region selected by longitude, could add land sea mask for detail analysis
invarAf = invar(:,:,{0:45})  
invarIn = invar(:,:,{45:105})  
invarWP = invar(:,:,{105:150})
invarCP = invar(:,:,{105:150})
invarEP = invar(:,:,{150:280})
invarSA = invar(:,:,{280:315})
invarAt = invar(:,:,{315:360})

;calculate MCS number in each region
var = dim_sum_n_Wrap(invar,(/1,2/))
varGlo = dim_sum_n(invar,(/1,2/)) 

varN = dim_sum_n(invarN,(/1,2/)) 
varS = dim_sum_n(invarS,(/1,2/)) 

varLand = dim_sum_n(invarLand,(/1,2/)) 
varSea  = dim_sum_n(invarSea, (/1,2/)) 

varAf = dim_sum_n(invarAf,(/1,2/)) 
varIn = dim_sum_n(invarIn,(/1,2/)) 
varWP = dim_sum_n(invarWP,(/1,2/)) 
varCP = dim_sum_n(invarCP,(/1,2/)) 
varEP = dim_sum_n(invarEP,(/1,2/)) 
varSA = dim_sum_n(invarSA,(/1,2/)) 
varAt = dim_sum_n(invarAt,(/1,2/)) 

lines = sprintf("%6.0f",time) + " " + \
        sprintf("%6.0f",varGlo) + " " + \
        sprintf("%6.0f",varLand) + " " + \
        sprintf("%6.0f",varSea) + " " + \
        sprintf("%6.0f",varN) + " " + \
        sprintf("%6.0f",varS) + " " + \
        sprintf("%6.0f",varAf) + " " + \
        sprintf("%6.0f",varIn) + " " + \
        sprintf("%6.0f",varWP) + " " + \
        sprintf("%6.0f",varCP) + " " + \
        sprintf("%6.0f",varEP) + " " + \
        sprintf("%6.0f",varSA) + " " + \
        sprintf("%6.0f",varAt)
asciiwrite("../data/record_num_max_exp3_region.txt",lines)

;lines = sprintf("%6.0f",time) + " " + \
;        sprintf("%6.0f",perGlo) + " " + \
;        sprintf("%6.0f",perLand) + " " + \
;        sprintf("%6.0f",perSea) + " " + \
;        sprintf("%6.0f",perN) + " " + \
;        sprintf("%6.0f",perS) + " " + \
;        sprintf("%6.0f",perAf) + " " + \
;        sprintf("%6.0f",perIn) + " " + \
;        sprintf("%6.0f",perWP) + " " + \
;        sprintf("%6.0f",perCP) + " " + \
;        sprintf("%6.0f",perEP) + " " + \
;        sprintf("%6.0f",perSA) + " " + \
;        sprintf("%6.0f",perAt)
;asciiwrite("../data/record_num_exp3_region_percent.txt",lines)
end
