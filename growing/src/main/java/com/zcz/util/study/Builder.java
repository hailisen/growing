package com.zcz.util.study;

import java.util.ArrayList;
import java.util.List;

/**
 * 建造类
 */
public class Builder {
    private List<HeroInterface> heroList = new ArrayList<>();
    public List<HeroInterface> getHeroList() {
        return heroList;
    }
    public void setHeroList(List<HeroInterface> heroList) {
        this.heroList = heroList;
    }

    public void buildGalen(int num){
        for(int i = 0;i<num;i++){
            heroList.add(new Galen());
        }
    }

    public void buildCatalina(int num){
        for(int i = 0;i<num;i++){
            heroList.add(new Catalina());
        }
    }
}
