Qreoh::Application.routes.draw do

  root :to => 'projects#home'
  mount Attachinary::Engine => "/attachinary"

  match  'switch_user' => 'switch_user#set_current_user'
  match  'sso' => 'discourse_sso#sso'

  match  'buy', to: 'orders#buy'
  match  'checkout', to: 'orders#checkout'
  post   'apply_coupon', to: 'orders#apply_coupon'
  match  'payment', to: 'orders#payment'
  match  'cod', to: 'orders#cod'
  post   'remove', to: 'orders#remove'
  post   'customize/:id', to: 'orders#customize'
  match  'projects/update', to: 'projects#update_status'
  match  'finalize', to: 'orders#finalize'
  delete 'cancel_order', to: 'orders#cancel'
  match  'search', to: 'projects#search'
  match  'collection/:collection', to: 'projects#collection'
  match  'junglee', to: 'projects#junglee'

  match  'qreoh-indie-festival', to: 'static#festival'
  match  'create', to: 'static#read'
  match  'create/look', to: 'static#look'
  match  'create/read', to: 'static#read'
  match  'create/go', to: 'static#go'
  match  'how-to-participate', to: 'static#read'
  match  'contact-us', to: 'static#contact-us'
  match  'newsletter', to: 'static#newsletter'
  match  'press', to: 'static#press'
  match  'faqs', to: 'static#faqs'
  match  'about', to: 'static#about'
  match  'how-it-works', to: 'static#look'
  match  'terms-and-conditions', to: 'static#terms-and-conditions'
  match  'privacy-policy', to: 'static#privacy-policy'
  match  'cancellation-policy', to: 'static#cancellation-policy'
  match  'shipping-policy', to: 'static#shipping-policy'
  match  'careers', to: 'static#careers'
  post   'subscribe', to: 'newsletter_subscribers#create'

  get    'messages', to: 'messages#index'
  get    'messages/sent', to: 'messages#sent'
  get    'messages/archive', to: 'messages#archive'
  post   'messages/send', to: 'messages#send_message'
  delete 'messages/delete/:id', to: 'messages#delete'

  match  'explore', :to => 'projects#list'
  match  'shop(/:primary_tags)(/:secondary_tags)(/:page)', :to => 'projects#one_of_a_kind', :as => 'shop', :constraints => {:primary_tags => /[^\(\)0-9,\/]*/, :secondary_tags => /[^\(\)0-9]*/ }
  match  'labs', :to => 'projects#preorders'
  get    'designs', to: 'projects#redirect_to_index'
  post   'ask_a_question', to: 'projects#ask_a_question'

  post   'give_feedback', :to => 'designers#add_feedback'
  post   'contact_designer', to: 'designers#contact'

  get    'orders', to: 'orders#index'
  get    'orders', to: 'orders#list'

  match  'my-account', to: 'accounts#profile'
  match  'favorites', to: 'accounts#profile'
  post   'favorite/:project_id', to: 'projects#favorite'
  post   'favorite/:project_id/delete', to: 'projects#unfavorite'

  post '/rate' => 'rater#create', :as => 'rate'

  match  'dashboard', to: 'dashboard#index'
  namespace :dashboard do
    resources :designers do
      collection do
        get 'pending'
        get 'active'
        get 'hidden'
        get 'current_collection'
      end
      member do
        put 'notify_approval'
        put 'notify_rejection'
      end
    end
    resources :projects do
      collection do
        get 'pending'
        get 'active'
        get 'hidden'
        get 'archived'
        get 'report'
      end
    end
    resources :orders do
      collection do
        get 'pending'
        get 'confirmed'
      end
      member do
        get 'pending_push'
        get 'ship'
        get 'delayed'
        get 'delivery'
        post 'notify_shipping'
      end
    end
    
    resources :tag_details

    resources :messages do
      collection do
        get 'archived'
        get 'trashed'
      end
    end
    resources :coupons do
      collection do
        get 'used'
        get 'active'
      end
    end
  end
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  mount Devise::Oauth2Providable::Engine => '/oauth'
  as :user do
    get "/login" => "devise/sessions#new", :as => 'login'
    get "/invite/:referral_code" => "devise/registrations#new", :as => 'signup'
  end

  get   'designers(/:page)', :to => 'designers#index'
  post  'designers', :to => 'designers#create'
  resources :designers, :path => '', :except => [:index, :create]
  resources :designers, :path => '', :only => [] do
    member do
      post 'follow'
      get  'manage'
    end
    post 'projects', :to => 'projects#create'
    resources :projects, :path => '', :except => [:index] do
      resources :project_updates
      resources :inventories
    end
  end
end
