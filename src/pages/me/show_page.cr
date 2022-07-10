class Me::ShowPage < MainLayout
  def content
    h1 "This is your profile"
    h3 "Email:  #{@current_user.email}"

    link "visit neighborhoods", to: Neighborhoods::Index
  end
end
