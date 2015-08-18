require  'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "chicken parm", summary: "This is the best chicken parm recipe ever",
              description: "Heat oil, add onions, add chicken, add tomato sauce, cook for 20 minutes")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name should not be too short" do
    @recipe.name = "a"
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end

  test "summary should not be too long" do
    @recipe.summary = "b" * 151
    assert_not @recipe.valid?
  end

  test "summary should not be too short" do
    @recipe.summary = "b"
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description should not be too long" do
    @recipe.description = "c" * 501
    assert_not @recipe.valid?
  end

  test "description should not be too short" do
    @recipe.description = "c"
    assert_not @recipe.valid?
  end

end  