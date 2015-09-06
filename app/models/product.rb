class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  belongs_to :store
  serialize :option_name
  serialize :option_value

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/




    INVENTORY_POLICY = [
	"Don't track inventory",
	"ZaySine track this product's inventory"]


 #    MULTIPLE_OPTION = [
	# "Size",
	# "Color"]

# after_save :post_to_fb

  private




  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors[:base] << "Line Items present"
      return false
    end
  end
   

    def post_to_fb
 

        product_name = self.product_name
        product_category = self.category_id
        product_store = self.store_id
        product_sc =  product_category.to_s
                      product_store.to_s
        product_brand = self.brand_id
        product_desc  = self.desc
        page_token = self.token
        product_pic  = self.avatar.url(:medium)


         me = FbGraph::User.me(page_token)

         me.feed!(
            :message => product_desc,
            :link => "https://www.zaysine.com/buy_from_post/"+self.id.to_s,
            :name => product_name,
            :picture => "https://www.zaysine.com/"+product_pic
          )

    end




end
