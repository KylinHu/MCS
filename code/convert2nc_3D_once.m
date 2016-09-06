clear
clc
%%%convert to nc
%input_path='/Users/hcq/workspace/MCS_2016_private/data/space/';
input_path='/home/hxm_stu/WORK1/hcq/MCS/data';
input_name = 'num_max_yr86yr05monthly_exp3.mat';   %alltime series
load (fullfile(input_path, input_name));

num_max = max_num;
num_cent = cent_num;
%numb = num;
%temp = tem;
%dura = duration;
%size = coverage;

%temp(isnan(temp))=-999.0;
%dura(isnan(dura))=-999.0;
%size(isnan(size))=-999.0;

% time = 1:240;
lat = (30:-1/3:-30);
lon = (0:1/3:360-1/3);
% lat = (0:180);
% lon = (1:1080);
% ncid = netcdf.create('test3.nc','NC_CLOBBER');    %?????????nc??
% ncid = netcdf.create('pixelxy_numyr86yr05monthly.nc','NC_CLOBBER');   
ncid = netcdf.create('../data/num_max_yr86yr05monthly_exp3.nc','NC_CLOBBER'); 

%-----------------------------define dimension-----------------------------%   ???????????????????????????????????
%     dimidx = netcdf.defDim(ncid,'lat',242);    
%     dimidy = netcdf.defDim(ncid,'dep',50);
%     dimidz = netcdf.defDim(ncid,'time',12);
    dimidy = netcdf.defDim(ncid,'lat',181);    
    dimidx = netcdf.defDim(ncid,'lon',1080);
    dimidz = netcdf.defDim(ncid,'time',240);


%----------------------------define new variables---------------------------------%
%     varid = netcdf.defVar(ncid,'strf','double',[dimidx dimidy dimidz]);
%     varid2 = netcdf.defVar(ncid,'lat','double',[dimidx]);
%     varid3 = netcdf.defVar(ncid,'dep','double',[dimidy]);
%  varid = netcdf.defVar(ncid,'numb','double',[dimidx dimidy dimidz]);
%  varid1 = netcdf.defVar(ncid,'temp','double',[dimidx dimidy dimidz]);
%  varid11 = netcdf.defVar(ncid,'dura','double',[dimidx dimidy dimidz]);
%  varid12 = netcdf.defVar(ncid,'size','double',[dimidx dimidy dimidz]);
  varid = netcdf.defVar(ncid,'num_max','double',[dimidx dimidy dimidz]);
  varid1 = netcdf.defVar(ncid,'num_cent','double',[dimidx dimidy dimidz]);

  varid2 = netcdf.defVar(ncid,'lat','float',(dimidy));
  varid3 = netcdf.defVar(ncid,'lon','float',(dimidx));
  varid4 = netcdf.defVar(ncid,'time','float',(dimidz));



%---------------------------define attributes of the new variables--------------%  
%     netcdf.putAtt(ncid,varid,'units','Sv');                                                     %?????long_name???????????
%     netcdf.putAtt(ncid,varid2,'units','degress_north');                 
%     netcdf.putAtt(ncid,varid3,'units','m');
%     netcdf.putAtt(ncid,varid,'long_name','The Meridional streamfunction ');
%     netcdf.putAtt(ncid,varid2,'long_name','Latitude');
%     netcdf.putAtt(ncid,varid3,'long_name','Depth');
%     netcdf.endDef(ncid);

    netcdf.putAtt(ncid,varid,'units','n');   
    netcdf.putAtt(ncid,varid1,'units','n');   
%    netcdf.putAtt(ncid,varid1,'units','K');
%    netcdf.putAtt(ncid,varid11,'units','hours'); 
%    netcdf.putAtt(ncid,varid12,'units','km2');

    netcdf.putAtt(ncid,varid2,'units','degrees_north');                 
    netcdf.putAtt(ncid,varid3,'units','degrees_east');
    netcdf.putAtt(ncid,varid4,'units','month'); 
    
    netcdf.putAtt(ncid,varid,'long_name','The MCS number for generate pixel');
    netcdf.putAtt(ncid,varid1,'long_name','The MCS number for generate centroid');
%    netcdf.putAtt(ncid,varid1,'long_name','The MCS intensity');
%    netcdf.putAtt(ncid,varid11,'long_name','The MCS duration');
%    netcdf.putAtt(ncid,varid12,'long_name','The MCS size');

    netcdf.putAtt(ncid,varid2,'long_name','Latitude');
    netcdf.putAtt(ncid,varid3,'long_name','Longitude');
    netcdf.putAtt(ncid,varid4,'long_name','Time');
    netcdf.endDef(ncid);

%--------------------------??????-------------------------------------------%
    netcdf.putVar(ncid,varid,num_max);
    netcdf.putVar(ncid,varid1,num_cent);
%    netcdf.putVar(ncid,varid1,temp);
%    netcdf.putVar(ncid,varid11,dura);
%    netcdf.putVar(ncid,varid12,size);
    netcdf.putVar(ncid,varid2,lat);netcdf.putVar(ncid,varid3,lon);netcdf.putVar(ncid,varid4,time);
    netcdf.close(ncid);
