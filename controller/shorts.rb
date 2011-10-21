##
# Le contrôleur de shorts permet de faire du CRUD sur les Short(ies))
#

class Shorts < Controller
  # Lists available shorts
  def index
    @title = "Shorties"
    @shorties = paginate(Short.all)
  end
  
  # Creates a new short
  def create
    if request.post? and url = request[:url]
      url.strip!
      url.gsub!(/^http[s]?:\/\//, '')

      unless url.empty?
        a = *('A'..'H')
        a.concat(('J'..'K').to_a).concat(('M'..'N').to_a).concat(('P'..'Z').to_a)
        a.concat(a.map {|v| v.downcase})
        
        s = (0..3).map{ a[rand(a.length)] }.join

        Short.create(:shorturl => s, :longurl => url)
      end
    end
  
    redirect route('/')

    rescue Sequel::DatabaseError => ex
      redirect route('/create', :url => url)
  end
end

