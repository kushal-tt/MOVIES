ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def current_ability
      @current_ability ||= ::Ability.new(current_user)
    end
  end
end