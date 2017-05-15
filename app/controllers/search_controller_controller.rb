class SearchControllerController < ApplicationController
  def search
    content = "contenido LIKE ?", "%#{params[:contenido]}%"
    if content
      @results = Status.where(content)
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
