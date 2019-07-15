ActiveAdmin.register Claim do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    belongs_to :company
    #
    # permit_params :list, :of, :attributes, :on, :model
    #
    permit_params :content, :user_id
    # or
    #
    # permit_params do
    #   permitted = [:permitted, :attributes]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    form do |f|
        f.inputs do
            f.input :user, collection: User.all.pluck(:email, :id)
            f.input :company, collection: Company.all.pluck(:name)
            f.input :content
        end
        actions
    end
end
