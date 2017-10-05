# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    user_first = User.create(username:"Murat",email:"rango@gmail.com",password:"123",password_confirmation:"123")
	user_second = User.create(username:"Renja",email:"tango@gmail.com",password:"123",password_confirmation:"123")
	
	photo_first = Photo.new({:title => 'desert', :user_id => user_first})
	photo_second = Photo.new({:title => 'coala', :user_id => user_second})
	photo_third = Photo.new({:title => 'light',  :user_id => user_first})
	photo_first.image = File.open(File.join(Rails.root,'app/assets/images/desert.jpg'))
	photo_second.image = File.open(File.join(Rails.root,'app/assets/images/coala.jpg'))
	photo_third.image = File.open(File.join(Rails.root,'app/assets/images/light.jpg'))
	
	photo_first.save!
	photo_second.save!
	photo_third.save!

	#

	comment_first = Comment.create(author:user_first.username,body:"nice koala",photo_id:photo_second)
	comment_second = Comment.create(author:user_first.username,body:"nice coala",photo_id:photo_second)

	5.times do |i|
      Comment.create(author:user_second,body:"Product ##{i}", photo_id:photo_third)
    end