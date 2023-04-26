package com.kbstar.frame;

import com.kbstar.dto.Cust;

import java.util.List;

public interface KBService<K, V> {
    public void register(V v) throws Exception;
    public void remove(K k) throws Exception;
    public void modify(V v) throws Exception;
    public Cust get(K k) throws Exception;
    public List<V> get() throws Exception;

}
