package com.base.service.address;

import java.util.List;

import com.base.pojo.address.AddressDetailInfo;

public interface AddressInfoService {
	List<AddressDetailInfo> getAddressListByUserName(String userName);
	void insert(AddressDetailInfo addressDetailInfo);
	void delete(AddressDetailInfo addressDetailInfo);
	void update(AddressDetailInfo addressDetailInfo);
	void changeDefaultAddress(AddressDetailInfo addressDetailInfo);
}
