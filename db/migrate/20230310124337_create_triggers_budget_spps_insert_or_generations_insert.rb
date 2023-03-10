# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggersBudgetSppsInsertOrGenerationsInsert < ActiveRecord::Migration[7.0]
  def up
    create_trigger("budget_spps_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("budget_spps").
        after(:insert) do
      <<-SQL_ACTIONS

        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('Janurary', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('February', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('March', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('April', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('May', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('June', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('July', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('August', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('September', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('October', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('November', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('December', NEW.id, CURRENT_TIME(), CURRENT_TIME());
      SQL_ACTIONS
    end

    create_trigger("generations_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("generations").
        after(:insert) do
      <<-SQL_ACTIONS

        SET @year1 = CAST(SUBSTRING_INDEX(NEW.years, '/', 1) AS UNSIGNED);
        SET @year2 = CAST(SUBSTRING_INDEX(NEW.years, '/', -1) AS UNSIGNED);

        WHILE @year1 <= @year2 DO
          INSERT INTO budget_spps (year, generation_id, created_at, updated_at) VALUES (CAST(@year1 AS NCHAR), NEW.id, CURRENT_TIME(), CURRENT_TIME());
          SET @year1 = @year1 + 1;
        END WHILE;
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("budget_spps_after_insert_row_tr", "budget_spps", :generated => true)

    drop_trigger("generations_after_insert_row_tr", "generations", :generated => true)
  end
end
