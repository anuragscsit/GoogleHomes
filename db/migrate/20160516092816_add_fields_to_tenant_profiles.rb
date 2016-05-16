class AddFieldsToTenantProfiles < ActiveRecord::Migration
  def change
  	add_column :tenant_profiles, :first_name, :string
  	add_column :tenant_profiles, :last_name, :string
  	add_column :tenant_profiles, :contact_no, :string
  	add_column :tenant_profiles, :email, :string  	
  	add_column :tenant_profiles, :identity_proof, :string
  	add_column :tenant_profiles, :address_proof, :string

    add_column :tenant_profiles, :occupation, :string
    add_column :tenant_profiles, :orgnization, :string
    add_column :tenant_profiles, :office_email, :string
    add_column :tenant_profiles, :years_of_employement, :integer
    add_column :tenant_profiles, :employment_proof, :string

  	add_column :tenant_profiles, :account_holder, :string
    add_column :tenant_profiles, :account_number, :string
    add_column :tenant_profiles, :bank_name, :string
  	add_column :tenant_profiles, :ifsc_code, :string
  	add_column :tenant_profiles, :cheque, :string

  	add_column :tenant_profiles, :emergency_person_name, :string
  	add_column :tenant_profiles, :emergency_person_contact, :string
  	add_column :tenant_profiles, :emergency_person_relationship, :string
  	add_column :tenant_profiles, :emergency_person_address, :string
  end
end
