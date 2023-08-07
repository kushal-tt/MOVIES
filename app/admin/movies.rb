ActiveAdmin.register Movie do
 permit_params :title, :description, :release_date, :genre_id, :image
  index do
    selectable_column
    id_column
    column :display_title, as: :title
    column :description
    column :release_date
    column :average_rating
    actions
  end

  show do
    attributes_table do
      row :title
      row :image do |school|
        if school.image.attached?
           div class: 'image' do
              image_tag url_for(school.image), style: 'max-width: 200px; max-height: 100px;'
            end
        else
          span 'No File attached'
        end
      end
      row :description
      row :release_date

      panel "Ratings and Reviews" do
        table_for movie.ratings do
          column :user
          column :score
          column :review
           column "Actions" do |rating|
          link_to "Delete", admin_rating_path(rating), method: :delete, data: { confirm: "Are you sure you want to delete this review?" }
        end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :release_date, as: :date_select, start_year: Date.current.year, end_year: Date.current.year - 50
      f.input :genre
      f.input :image, as: :file
    end
    f.actions
  end

  filter :average_rating
  filter :title                 
  filter :description
  filter :release_date
  filter :genre

end

