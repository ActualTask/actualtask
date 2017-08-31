class Myprofile::MyprofileController < ApplicationController

  before_action :authenticate_user!
end
