Rails.application.routes.draw do
  devise_for :students, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { sessions: 'students/sessions' } 
  devise_for :admins, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { sessions: 'admins/sessions' }
  
  devise_scope :student do
    authenticated :student do
      namespace :students do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  devise_scope :admin do
    authenticated :admin do
      namespace :admins do
        namespace :admin do
          get 'dashboard/index', as: :authenticated_root
          get 'payments/index'
          get 'payment_methods/index'
          get 'budget_spps/index'
          namespace :categories do
            get 'majors/index'
            get 'generations/index'
            get 'class_rooms/index'
          end
          namespace :users do
            get 'staffs/index'
            get 'students/index'
            get 'admins/index'
          end
        end
        namespace :staff do
          get 'dashboard/index', as: :authenticated_root
        end
      end
    end
  end

  root to: 'pages#index'
end
