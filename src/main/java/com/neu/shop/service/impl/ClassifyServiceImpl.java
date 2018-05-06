package com.neu.shop.service.impl;

import com.neu.shop.dao.ClassifyMapper;
import com.neu.shop.pojo.Classify;
import com.neu.shop.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service("classifyService")
public class ClassifyServiceImpl implements ClassifyService {

    @Autowired
    ClassifyMapper classifyMapper;

    @Override
    public List<Classify> loadAllFirstClass() {
        return  classifyMapper.loadAllFirstClass();
    }
}
