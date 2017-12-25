require 'spec_helper'

describe Goal do
  it 'New goals' do
    @goal = FactoryGirl.build(:goal)
    expect(@goal.title).to eq("Sample title")
      expect(@goal.description).to eq("Sample description")
      expect(@goal.priority).to eq(1)
      expect(@goal.user_id).to eq(1)
    end

    context 'valid' do
      subject { FactoryGirl.create(:goal) } 
      it { should be_valid(:title ) }
      it { should be_valid(:description) }
      it { should be_valid(:priority) } 
      it { should be_valid(:due_date) }
   end
end
