require 'fileutils'

class UploadController < ApplicationController
   def index
      render :file => 'app\views\upload\uploadfile.html.erb'
   end
   def uploadFile
	userId = params[:userId].split('@')[0]

	puts "userId: ", userId
	
	FileUtils.mkdir_p Rails.root.join('public', 'data', userId)
       
	uploaded_file = params[:picture]
	File.open(Rails.root.join('public', 'data', userId, uploaded_file.original_filename), 'wb') do |file|
    		file.write(uploaded_file.read)
  	end
	render :file => 'app\views\users\show.html.erb'
   end
   
   def file_cleanup
      
      File.delete(Rails.root + 'public/data'+ userid+'/'+#{current_user.image.url})
      redirect_to :action => :edit
    end
   end
end
