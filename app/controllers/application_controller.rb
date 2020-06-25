class ApplicationController < Sinatra::Base
  set :views, "app/views"

  get ('/apartment/:id') do 
    @apartment = Apartment.find(params[:id])
    @apartment.address
    @apartment_array = @apartment.tenants
    erb(:apartment_info)
  end

  get('/update/:id') do 
    @tenant = Tenant.find(params[:id])
    erb(:update_tenant)
  end

  patch ('/update/:id') do 
    @tenant = Tenant.find(params[:id])
    @tenant.name = params[:name]
    @tenant.save()

    @tenant.apartment_id = params[:apartment_id]
    @tenant.save()
  end



  get ('/tenant-list') do 

    @tenants = Tenant.all

    erb(:tenant_list)
  
  end

  get ('/apartment-list') do 

    @apartments = Apartment.all

    erb(:apartment_list)
  end


  get('/make-an-apartment') do 
    erb(:make_apartment)

  end

  post('/make-an-apartment') do
    @new_apartment = Apartment.create({
      address: params[:apartment_address]
     })
    redirect ("/apartment-list")
  end

  get('/make-a-tenant') do 
    erb(:make_tenant)
  end

  post('/make-a-tenant') do
    @new_tenant = Tenant.create({
      name: params[:tenant_name],
      apartment_id: params[:tenant_apt_id]
     })
    redirect ("/tenant-list")
  end

  delete('/remove/:id') do 
    @apartment = Apartment.find(params[:id])
    @apartment.destroy() 
    redirect('/apartment-list')
  end
  
  delete('/remove-tenant/:id') do 
    @tenant = Tenant.find(params[:id])
    @tenant.destroy() 
    redirect('/tenant-list')
  end


 
end
