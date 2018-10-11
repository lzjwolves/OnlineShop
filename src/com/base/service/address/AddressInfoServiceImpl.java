package com.base.service.address;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.base.mapper.AddressMapper;
import com.base.pojo.address.AddressDetailInfo;
@Service
public class AddressInfoServiceImpl implements AddressInfoService{
	@Resource
	private AddressMapper addressMapper;
	@Transactional
	@Override
	public List<AddressDetailInfo> getAddressListByUserName(String userName) {
		// TODO Auto-generated method stub
		return addressMapper.getAddressListByUserName(userName);
	}
	@Transactional
	@Override
	public void insert(AddressDetailInfo addressDetailInfo) {
		// TODO Auto-generated method stub
		addressMapper.insert(addressDetailInfo);
	}
	@Transactional
	@Override
	public void delete(AddressDetailInfo addressDetailInfo) {
		// TODO Auto-generated method stub
		addressMapper.delete(addressDetailInfo);
	}
	@Transactional
	@Override
	public void update(AddressDetailInfo addressDetailInfo) {
		// TODO Auto-generated method stub
		addressMapper.update(addressDetailInfo);
	}
	@Transactional
	@Override
	public void changeDefaultAddress(AddressDetailInfo addressDetailInfo) {
		// TODO Auto-generated method stub
		addressMapper.setDefault_1(addressDetailInfo);
		addressMapper.setDefault_0(addressDetailInfo);
	}

}
