class GenesController < ApplicationController
  def index
    @genes = Gene.all #allows index view to access articles hash
    respond_to do |format|
      format.html
      format.csv { send_data @genes.to_csv}
    end
  end

  def show
    @gene = Gene.find(params[:id]) #get show to show individual gene
  end

  def searchID
    @genes = Gene.where("identity LIKE ? ","%" + params[:q] + "%")
  end 

  def searchName
    @genes = Gene.where("name LIKE ? ","%" + params[:q] + "%")
  end

  def searchType
    @genes = Gene.where("form LIKE ? ","%" + params[:q] + "%")
    @images = Image.where("form LIKE ? ","%" + params[:q] + "%") #why doesn't this line work?
    @webs = Web.where("form LIKE ? ","%" + params[:q] + "%")
  end

  def searchInType
    #@genes = Gene.select {|item| item.include?(params[:q])} #maybe this will work? Haven't tested it yet
    #@genes = Gene.where("idenity=:thing", {thing: "KRAS"})#params[:q]} )#kina giving up on this for now
    @genes = Gene.where("identity LIKE ? ","%" + params[:q] + "%")
  end

  def searchWeb
    @webs = Web.where("form LIKE ? ","%" + params[:q] + "%")
  end
end