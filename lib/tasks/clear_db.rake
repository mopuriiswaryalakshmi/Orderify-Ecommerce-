task :clear_db => :environment do 
	Category.delete_all
	Product.delete_all
end


