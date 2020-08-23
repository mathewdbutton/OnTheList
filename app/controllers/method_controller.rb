class MethodController < ApplicationController
  Method = Struct.new(:step, :replacements, :ordering)
  def show
    @method = Method.new("Add %s and then mix in with %s", ListItem.all.sample(2), 1)
  end
end
