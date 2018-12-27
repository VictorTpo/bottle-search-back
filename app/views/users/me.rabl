object @user
attributes :id, :email

child(:profile) do
  attributes :id, :full_name, :birthday
end
