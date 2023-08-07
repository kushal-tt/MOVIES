ActiveAdmin.register Rating do
 permit_params :score, :user_id, :movie_id, :review
  actions :index, :show, :destroy

  index do
    selectable_column
    id_column
    column :score
    column "Movie" do |rating|
    rating.movie.title.capitalize
   end
    column :review
    column :user
    actions
  end

  filter :score
  filter :movie


  controller do
    def create
      super do |format|
        redirect_to collection_path, notice: "Rating submitted successfully." and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to collection_path, notice: "Rating updated successfully." and return if resource.valid?
      end
    end
  end
end