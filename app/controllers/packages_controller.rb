class PackagesController < ApplicationController

  def index
    @packages = policy_scope(Package)
  end
end
