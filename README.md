# README

App performing core functionality of FACEBOOK  

[Instructions](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project)  

[Friendship association](https://hackernoon.com/how-to-create-a-friendship-relation-on-rails-c01d3u4v)  

[Cloud storage used](https://medium.com/nerd-for-tech/getting-started-with-cloudinary-in-ruby-on-rails-6-925888032395)

NOTE:  
didn't use provider,uid in users table during omniauth user creation proscess and relay on email  
only as opposed to how it was shown in facebook's case (see self.from_omniauth in user.rb)  
Github unlike google only allows 1 authorization callback url so, Changed it to production (heroku) url from localhost in github oauth app setting. To use Github login again locally, will have to change the authorization callback url  to localhost (along with homepage url as well)  

TO DO:  
add feature: remove profile pic  
thought: need seprate page for request/profile logic instead of showing it on user#show?  
feature: add validation to comments?, edit comment etc.  
add feature: SPA-fiy posts' profile's comments' creation/edit (editing first)  
add feature: Live notification (count and stuff) excid3/noticed gem  
cover: Integration/Unit Tests for whole app using guard  
