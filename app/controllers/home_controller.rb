class HomeController < ApplicationController
  def index
  	@slider_mobiles = Mobile.limit(3)
  	if params['delar_city'].present?
      delars = Delar.where(:city => params['delar_city'])
    end
  	if request.xhr?
  		@mobiles = if params['mobile'].present?
	                  if delars.present?
	                    Mobile.joins(:mobiles_delars).where(mobile_params).where(["mobiles_delars.delar_id IN (?)", delars.map(&:id)]).uniq
	                  else
	                    Mobile.where(mobile_params).uniq
	                  end
               	   else
	  				   if delars.present?
	                     Mobile.joins(:mobiles_delars).where(["mobiles_delars.delar_id IN (?)", delars.map(&:id)]).uniq
	                   else
	                     Mobile.all.uniq
	                   end
	               end    
        render :partial => 'home/thumb_mobile', :collection => @mobiles,  :as => :mobile, :layout => false           
  	else	
  		@mobiles = Mobile.all
  	end	
  end

  def mobile_show
  	@mobile = Mobile.find(params[:mobile_id])
  end	

  private

  def mobile_params
  	params.require(:mobile).permit({:brand_name => []}, {:mobile_type => []}, {:battery_capacity => []}, {:screen_size => []},
                                   {:ram => []}, {:sim_type => []}, {:primary_camera => []}, {:os_version_name => []}, {:secondary_camera => []},
                                   {:features => []}, {:number_of_cores => []})
  end
end
