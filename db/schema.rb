# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151220022521) do

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true

  create_table "billing_bills", force: :cascade do |t|
    t.integer  "billable_id"
    t.string   "billable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "charges_sum_cents",       default: 0,     null: false
    t.string   "charges_sum_currency",    default: "USD", null: false
    t.integer  "discounts_sum_cents",     default: 0,     null: false
    t.string   "discounts_sum_currency",  default: "USD", null: false
    t.integer  "payments_sum_cents",      default: 0,     null: false
    t.string   "payments_sum_currency",   default: "USD", null: false
    t.integer  "total_cents",             default: 0,     null: false
    t.string   "total_currency",          default: "USD", null: false
    t.integer  "balance_cents",           default: 0,     null: false
    t.string   "balance_currency",        default: "USD", null: false
    t.integer  "surcharges_sum_cents",    default: 0,     null: false
    t.string   "surcharges_sum_currency", default: "USD", null: false
    t.integer  "origin_id"
    t.integer  "extface_job_id"
    t.integer  "report_id"
    t.boolean  "autofin",                 default: true
    t.datetime "finalized_at"
    t.string   "name"
    t.string   "number"
    t.datetime "deleted_at"
  end

  add_index "billing_bills", ["billable_type", "billable_id"], name: "index_billing_bills_on_billable_type_and_billable_id"
  add_index "billing_bills", ["extface_job_id"], name: "index_billing_bills_on_extface_job_id"
  add_index "billing_bills", ["origin_id"], name: "index_billing_bills_on_origin_id"
  add_index "billing_bills", ["report_id"], name: "index_billing_bills_on_report_id"

  create_table "billing_charges", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "chargable_id"
    t.string   "chargable_type"
    t.integer  "price_cents",                            default: 0,     null: false
    t.string   "price_currency",                         default: "USD", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "description"
    t.integer  "origin_id"
    t.integer  "value_cents",                            default: 0,     null: false
    t.string   "value_currency",                         default: "USD", null: false
    t.datetime "deleted_at"
    t.datetime "revenue_at"
    t.decimal  "qty",            precision: 6, scale: 3
    t.decimal  "tax_ratio",      precision: 6, scale: 3
  end

  add_index "billing_charges", ["bill_id"], name: "index_billing_charges_on_bill_id"
  add_index "billing_charges", ["chargable_type", "chargable_id"], name: "index_billing_charges_on_chargable_type_and_chargable_id"
  add_index "billing_charges", ["deleted_at"], name: "index_billing_charges_on_deleted_at"
  add_index "billing_charges", ["origin_id"], name: "index_billing_charges_on_origin_id"
  add_index "billing_charges", ["revenue_at"], name: "index_billing_charges_on_revenue_at"

  create_table "billing_departments", force: :cascade do |t|
    t.integer  "master_id"
    t.string   "name"
    t.integer  "tax_group_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.boolean  "banned"
    t.datetime "deleted_at"
  end

  add_index "billing_departments", ["deleted_at"], name: "index_billing_departments_on_deleted_at"
  add_index "billing_departments", ["tax_group_id"], name: "index_billing_departments_on_tax_group_id"

  create_table "billing_modifiers", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "charge_id"
    t.decimal  "percent_ratio",        precision: 6, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fixed_value_cents",                            default: 0,     null: false
    t.string   "fixed_value_currency",                         default: "USD", null: false
    t.datetime "deleted_at"
  end

  add_index "billing_modifiers", ["bill_id"], name: "index_billing_modifiers_on_bill_id"

  create_table "billing_op_fp_mappings", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "extface_driver_id"
    t.integer  "mapping"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pwd"
  end

  add_index "billing_op_fp_mappings", ["extface_driver_id"], name: "index_billing_op_fp_mappings_on_extface_driver_id"
  add_index "billing_op_fp_mappings", ["operator_id"], name: "index_billing_op_fp_mappings_on_operator_id"

  create_table "billing_operators", force: :cascade do |t|
    t.integer  "master_id"
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.boolean  "banned"
    t.datetime "deleted_at"
  end

  add_index "billing_operators", ["deleted_at"], name: "index_billing_operators_on_deleted_at"

  create_table "billing_origins", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_id"
    t.integer  "fiscal_device_id"
    t.boolean  "banned"
    t.datetime "deleted_at"
    t.string   "type"
    t.string   "payment_model",      default: "Billing::PaymentWithType"
    t.integer  "transfer_device_id"
  end

  add_index "billing_origins", ["deleted_at"], name: "index_billing_origins_on_deleted_at"
  add_index "billing_origins", ["fiscal_device_id"], name: "index_billing_origins_on_fiscal_device_id"
  add_index "billing_origins", ["transfer_device_id"], name: "index_billing_origins_on_transfer_device_id"

  create_table "billing_payment_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "cash"
    t.boolean  "fiscal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "master_id"
    t.integer  "number"
    t.boolean  "banned"
    t.datetime "deleted_at"
    t.boolean  "print_copy"
  end

  add_index "billing_payment_types", ["deleted_at"], name: "index_billing_payment_types_on_deleted_at"

  create_table "billing_payments", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "value_cents",     default: 0,     null: false
    t.string   "value_currency",  default: "USD", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "payment_type_id"
    t.string   "status"
    t.string   "name"
    t.string   "description"
    t.string   "external_token"
    t.string   "note"
    t.datetime "deleted_at"
  end

  add_index "billing_payments", ["bill_id"], name: "index_billing_payments_on_bill_id"
  add_index "billing_payments", ["deleted_at"], name: "index_billing_payments_on_deleted_at"

  create_table "billing_plus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_id"
    t.integer  "tax_group_id"
    t.integer  "department_id"
    t.integer  "number"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.string   "code"
    t.string   "type"
    t.boolean  "banned"
    t.datetime "deleted_at"
  end

  add_index "billing_plus", ["department_id"], name: "index_billing_plus_on_department_id"
  add_index "billing_plus", ["tax_group_id"], name: "index_billing_plus_on_tax_group_id"

  create_table "billing_profiles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billing_pt_fp_mappings", force: :cascade do |t|
    t.integer  "payment_type_id"
    t.integer  "extface_driver_id"
    t.integer  "mapping"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_pt_fp_mappings", ["extface_driver_id"], name: "index_billing_pt_fp_mappings_on_extface_driver_id"
  add_index "billing_pt_fp_mappings", ["payment_type_id"], name: "index_billing_pt_fp_mappings_on_payment_type_id"

  create_table "billing_reports", force: :cascade do |t|
    t.integer  "master_id"
    t.integer  "origin_id"
    t.integer  "payments_sum_cents",       default: 0,     null: false
    t.string   "payments_sum_currency",    default: "USD", null: false
    t.integer  "payments_cash_cents",      default: 0,     null: false
    t.string   "payments_cash_currency",   default: "USD", null: false
    t.integer  "payments_fiscal_cents",    default: 0,     null: false
    t.string   "payments_fiscal_currency", default: "USD", null: false
    t.text     "note"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "extface_job_id"
    t.date     "f_period_from"
    t.date     "f_period_to"
    t.boolean  "zeroing"
    t.string   "f_operation"
    t.integer  "f_amount_cents",           default: 0,     null: false
    t.string   "f_amount_currency",        default: "USD", null: false
    t.datetime "deleted_at"
  end

  add_index "billing_reports", ["origin_id"], name: "index_billing_reports_on_origin_id"

  create_table "billing_resources", force: :cascade do |t|
    t.integer  "master_id"
    t.string   "name"
    t.text     "properties"
    t.boolean  "banned"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "billing_tax_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_id"
    t.integer  "number"
    t.decimal  "percent_ratio", precision: 6, scale: 3
    t.boolean  "banned"
    t.string   "type"
    t.datetime "deleted_at"
  end

  create_table "billing_tg_fp_mappings", force: :cascade do |t|
    t.integer  "tax_group_id"
    t.integer  "extface_driver_id"
    t.integer  "mapping"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_tg_fp_mappings", ["extface_driver_id"], name: "index_billing_tg_fp_mappings_on_extface_driver_id"
  add_index "billing_tg_fp_mappings", ["tax_group_id"], name: "index_billing_tg_fp_mappings_on_tax_group_id"

  create_table "billing_versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.string   "ip"
    t.string   "user_agent"
    t.text     "object_changes"
    t.integer  "master_id"
    t.string   "master_type"
  end

  add_index "billing_versions", ["item_type", "item_id"], name: "index_billing_versions_on_item_type_and_item_id"

  create_table "businesses", force: :cascade do |t|
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uuid"
    t.string   "name"
  end

  add_index "businesses", ["account_id"], name: "index_businesses_on_account_id"

  create_table "selling_chargeables", force: :cascade do |t|
    t.integer  "billable_id"
    t.integer  "holdable_id"
    t.string   "holdable_type"
    t.integer  "master_id"
    t.string   "type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "selling_chargeables", ["billable_id"], name: "index_selling_chargeables_on_billable_id"
  add_index "selling_chargeables", ["holdable_type", "holdable_id"], name: "index_selling_chargeables_on_holdable_type_and_holdable_id"

  create_table "selling_configs", force: :cascade do |t|
    t.integer  "master_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "profile_title"
    t.string   "resource_title"
    t.string   "resource_type_title"
    t.string   "occupation_title"
    t.integer  "default_origin_id"
    t.integer  "sellable_id"
    t.string   "sellable_type"
    t.integer  "default_profile_id"
  end

  add_index "selling_configs", ["sellable_id", "sellable_type"], name: "index_selling_configs_on_sellable_id_and_sellable_type"

  create_table "selling_daytime_zones", force: :cascade do |t|
    t.string   "name"
    t.time     "from"
    t.integer  "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selling_packages", force: :cascade do |t|
    t.integer  "master_id"
    t.integer  "resource_type_id"
    t.integer  "seazon_id"
    t.integer  "daytime_zone_id"
    t.integer  "months"
    t.integer  "days"
    t.integer  "stay"
    t.decimal  "qty",              precision: 6, scale: 3
    t.integer  "plu_id"
    t.boolean  "recurring"
    t.string   "type"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "selling_packages", ["daytime_zone_id"], name: "index_selling_packages_on_daytime_zone_id"
  add_index "selling_packages", ["resource_type_id"], name: "index_selling_packages_on_resource_type_id"
  add_index "selling_packages", ["seazon_id"], name: "index_selling_packages_on_seazon_id"

  create_table "selling_profiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "master_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selling_rates", force: :cascade do |t|
    t.integer  "master_id"
    t.integer  "resource_type_id"
    t.integer  "seazon_id"
    t.integer  "daytime_zone_id"
    t.integer  "plu_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "selling_rates", ["daytime_zone_id"], name: "index_selling_rates_on_daytime_zone_id"
  add_index "selling_rates", ["resource_type_id"], name: "index_selling_rates_on_resource_type_id"
  add_index "selling_rates", ["seazon_id"], name: "index_selling_rates_on_seazon_id"

  create_table "selling_resource_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selling_resources", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_type_id"
    t.integer  "master_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "selling_resources", ["resource_type_id"], name: "index_selling_resources_on_resource_type_id"

  create_table "selling_seazons", force: :cascade do |t|
    t.string   "name"
    t.date     "from"
    t.integer  "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
