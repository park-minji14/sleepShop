package com.sgsg.dra.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Faq;
import com.sgsg.dra.admin.mapper.FaqManageMapper;

@Service
public class FaqManageServiceImpl implements FaqManageService {

    @Autowired
    private FaqManageMapper mapper;

    @Override
    public void insertFAQ(Faq faq) throws SQLException {

        try {
            mapper.insertFAQ(faq);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void updateFAQ(Faq faq) throws SQLException {
        try {
            mapper.updateFAQ(faq);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void deleteFAQ(Long faqNum) throws SQLException {
        try {
            mapper.deleteFAQ(faqNum);
        } catch (Exception e) {
            throw e;
        }
    }

	@Override
	public List<Faq> listFAQ(Map<String, Object> map) throws SQLException {
	    try {
	        return mapper.listFAQ(map);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

	@Override
	public List<Faq> listAllFAQ(Map<String, Object> map) throws Exception {
		try {
			return mapper.listAllFAQ(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Faq getFaqById(Long faqNum) throws Exception {
		try {
			return mapper.getFaqById(faqNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}