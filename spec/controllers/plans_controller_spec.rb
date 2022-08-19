require 'rails_helper'

RSpec.describe PlansController, type: :controller do
  describe 'GET #index' do
    let!(:plan_solo) { FactoryBot.create(:plan, :solo) }
    let!(:plan_startup) { FactoryBot.create(:plan, :startup) }
    let!(:plan_enterprise) { FactoryBot.create(:plan, :enterprise) }
    render_views
    let(:plan_list) do
      {
        'plans' => [
          {
            'additional_user_fee' => nil,
            'id' => plan_solo.id,
            'name' => 'solo',
            'price_monthly' => '2.0',
            'price_yearly' => '2.0', 'user_limit' => 1,
          },
          {
            'additional_user_fee' => '7.0',
            'id' => plan_startup.id,
            'name' => 'startup',
            'price_monthly' => '20.0',
            'price_yearly' => '18.0',
            'user_limit' => 5,
          },
          {
            'additional_user_fee' => '6.0',
            'id' => plan_enterprise.id,
            'name' => 'enterprise',
            'price_monthly' => '60.0',
            'price_yearly' => '55.0',
            'user_limit' => 20,
          },
        ],
      }
    end

    it 'returns response of json' do
      get :index, params: { format: :json }
      expect(JSON.parse(response.body)).to eq(plan_list)
    end
  end

  describe 'GET #calculate_bill' do
    let(:plan_startup) { FactoryBot.create(:plan, :startup) }
    context 'when search succeeds' do
      it 'returns response of calculated bill for monthly' do
        get :calculate_bill,
            params: { number_of_user: 22, id: plan_startup.id, subscription_type: 'monthly', format: :json }
        expect(JSON.parse(response.body)).to eq('calculated_amount' => '139.0')
      end

      it 'returns response of calculated bill for yearly' do
        get :calculate_bill,
            params: { number_of_user: 22, id: plan_startup.id, subscription_type: 'yearly', format: :json }
        expect(JSON.parse(response.body)).to eq('calculated_amount' => '137.0')
      end
    end
  end
end
