require "rails_helper"

RSpec.describe ArticlesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/manage/articles").to route_to("articles#index")
    end

    it "routes to #new" do
      expect(get: "/manage/articles/new").to route_to("articles#new")
    end

    it "routes to #show" do
      expect(get: "/manage/articles/1").to route_to("articles#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/manage/articles/1/edit").to route_to("articles#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/manage/articles").to route_to("articles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/manage/articles/1").to route_to("articles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/manage/articles/1").to route_to("articles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/manage/articles/1").to route_to("articles#destroy", id: "1")
    end
  end
end
