class Rsd < Application
  def show
    render(:format => :xml)
  end
end