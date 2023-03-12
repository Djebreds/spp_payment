class BudgetSpp < ApplicationRecord
  belongs_to :generation
  has_many :monthly_spps, dependent: :delete_all

  trigger.after(:insert) do
    "
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('January', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('February', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('March', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('April', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('May', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('June', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('July', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('August', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('September', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('October', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('November', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('December', NEW.id, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
    "
  end
end
