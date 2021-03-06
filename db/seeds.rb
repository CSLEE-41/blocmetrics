require 'faker'

#User
# 1.times do

# for if this user already exists 
if mock_user = User.find_by(email: "highergrounds.clee41@gmail.com")
else

  mock_user = User.new(

      name: 'Chris ',
      email: 'highergrounds.clee41@gmail.com',
      password: 'helloworld'
    )

    mock_user.save
end
# end


#create Registered Apps 

10.times do
  registered_application = RegisteredApplication.create!(

        user: mock_user,
        name: Faker::App.name,
        url:  Faker::Internet.url,
    )
end

registered_applications = RegisteredApplication.all

40.times do
  event = Event.create!(

        registered_application: registered_applications.sample,
        name: Faker::Lorem.word
    )

end



puts "Seeds Finished"
puts "#{RegisteredApplication.count} apps created."
puts "#{Event.count} events created"

