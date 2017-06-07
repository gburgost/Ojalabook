class SearchControllerController < ApplicationController
  def search
    title = "title LIKE ?", "%#{params[:title]}%"
    if title
      @statuses = Status.where(title)
    else
      puts "no se encontraron"
    end
    

    #content = params[:contenido]
    #if content
     # @results = Status.where(:contenido => content)
    #else
     # puts "no se encontraron"
    #end
  end
end
