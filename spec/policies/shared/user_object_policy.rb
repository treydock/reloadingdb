shared_examples 'UserObjectPolicy' do
  permissions ".scope" do
    it 'returns user owned record' do
      expect(policy_scope).to include(obj1)
    end
    it 'does not return another users record' do
      expect(policy_scope).not_to include(obj2)
    end
  end

  permissions :index? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
  end

  permissions :show? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
    it 'denies access' do
      expect(policy).not_to permit(user2, obj1)
    end
  end

  permissions :create? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
  end

  permissions :new? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
  end

  permissions :edit? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
    it 'denies access' do
      expect(policy).not_to permit(user2, obj1)
    end
  end

  permissions :update? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
    it 'denies access' do
      expect(policy).not_to permit(user2, obj1)
    end
  end

  permissions :discard? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
    it 'denies access' do
      expect(policy).not_to permit(user2, obj1)
    end
  end

  permissions :restore? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
    it 'denies access' do
      expect(policy).not_to permit(user2, obj1)
    end
  end

  permissions :delete? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
    it 'denies access' do
      expect(policy).not_to permit(user2, obj1)
    end
  end

  permissions :destroy? do
    it 'allows access' do
      expect(policy).to permit(user1, obj1)
    end
    it 'denies access' do
      expect(policy).not_to permit(user2, obj1)
    end
  end
end
