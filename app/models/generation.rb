class Generation < ApplicationRecord
  has_many :budget_spps, dependent: :delete_all
  has_many :students, dependent: :delete_all

  validates :years, presence: true, length: { is: 9 }

  trigger.after(:insert) do
    "
        SET @year1 = CAST(SUBSTRING_INDEX(NEW.years, '/', 1) AS UNSIGNED);
        SET @year2 = CAST(SUBSTRING_INDEX(NEW.years, '/', -1) AS UNSIGNED);

        WHILE @year1 <= @year2 DO
          INSERT INTO budget_spps (year, generation_id, created_at, updated_at) VALUES (CAST(@year1 AS NCHAR), NEW.id, CURRENT_TIME(), CURRENT_TIME());
          SET @year1 = @year1 + 1;
        END WHILE;
    "
  end
end
