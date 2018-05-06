package com.neu.shop.service;

import com.neu.shop.pojo.Classify;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("classifyService")
public interface ClassifyService {

    List<Classify> loadAllFirstClass();
}
