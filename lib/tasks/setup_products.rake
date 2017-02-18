task :setup_products => :environment do 
	10.times do 
		Category.create(name: Faker::Commerce.department(1))
	end

	Category.all.each do |category|
		5.times do 
			category.subcategories.create(name: Faker::Commerce.department(1))
		end
	end

	30.times do 
		category = Category.order("RANDOM()").first
		subcategory_id = category.subcategories.pluck(:id).sample
		Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price, category_id: category.id, subcategory_id: subcategory_id,  featured: [true,false].sample)
	end

end















=begin
task :setup_products => :environment do 

	
	# Create Roles
	Role.create(name: "admin")
	Role.create(name: "user")

	# Create Users & Assign Roles
	user = User.create(email: "admin@gmail.com", password: "secret123")
	user.roles.push(Role.first) #assign admin role
	user.roles.push(Role.last)  #assign user role

	
	user = User.create(email: "1@gmail.com", password: "secret123")
	user.roles.push(Role.last)


	







	10.times do 
		Category.create(name: Faker::Commerce.department(1))
	end

	100.times do 
		Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price, category_id: Category.all.pluck(:id).sample)
	end

end
=end