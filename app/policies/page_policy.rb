# frozen_string_literal: true

class PagePolicy < Struct.new(:user, :page)
  def show?
    true
  end
end
