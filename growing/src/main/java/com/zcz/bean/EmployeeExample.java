package com.zcz.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class EmployeeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EmployeeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNull() {
            addCriterion("phone is null");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNotNull() {
            addCriterion("phone is not null");
            return (Criteria) this;
        }

        public Criteria andPhoneEqualTo(String value) {
            addCriterion("phone =", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotEqualTo(String value) {
            addCriterion("phone <>", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThan(String value) {
            addCriterion("phone >", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("phone >=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThan(String value) {
            addCriterion("phone <", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThanOrEqualTo(String value) {
            addCriterion("phone <=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLike(String value) {
            addCriterion("phone like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotLike(String value) {
            addCriterion("phone not like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneIn(List<String> values) {
            addCriterion("phone in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotIn(List<String> values) {
            addCriterion("phone not in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneBetween(String value1, String value2) {
            addCriterion("phone between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotBetween(String value1, String value2) {
            addCriterion("phone not between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNull() {
            addCriterion("password is null");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNotNull() {
            addCriterion("password is not null");
            return (Criteria) this;
        }

        public Criteria andPasswordEqualTo(String value) {
            addCriterion("password =", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotEqualTo(String value) {
            addCriterion("password <>", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThan(String value) {
            addCriterion("password >", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("password >=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThan(String value) {
            addCriterion("password <", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThanOrEqualTo(String value) {
            addCriterion("password <=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLike(String value) {
            addCriterion("password like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotLike(String value) {
            addCriterion("password not like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordIn(List<String> values) {
            addCriterion("password in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotIn(List<String> values) {
            addCriterion("password not in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordBetween(String value1, String value2) {
            addCriterion("password between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotBetween(String value1, String value2) {
            addCriterion("password not between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andSexIsNull() {
            addCriterion("sex is null");
            return (Criteria) this;
        }

        public Criteria andSexIsNotNull() {
            addCriterion("sex is not null");
            return (Criteria) this;
        }

        public Criteria andSexEqualTo(String value) {
            addCriterion("sex =", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotEqualTo(String value) {
            addCriterion("sex <>", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexGreaterThan(String value) {
            addCriterion("sex >", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexGreaterThanOrEqualTo(String value) {
            addCriterion("sex >=", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexLessThan(String value) {
            addCriterion("sex <", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexLessThanOrEqualTo(String value) {
            addCriterion("sex <=", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexLike(String value) {
            addCriterion("sex like", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotLike(String value) {
            addCriterion("sex not like", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexIn(List<String> values) {
            addCriterion("sex in", values, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotIn(List<String> values) {
            addCriterion("sex not in", values, "sex");
            return (Criteria) this;
        }

        public Criteria andSexBetween(String value1, String value2) {
            addCriterion("sex between", value1, value2, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotBetween(String value1, String value2) {
            addCriterion("sex not between", value1, value2, "sex");
            return (Criteria) this;
        }

        public Criteria andBrithdayIsNull() {
            addCriterion("brithday is null");
            return (Criteria) this;
        }

        public Criteria andBrithdayIsNotNull() {
            addCriterion("brithday is not null");
            return (Criteria) this;
        }

        public Criteria andBrithdayEqualTo(Date value) {
            addCriterionForJDBCDate("brithday =", value, "brithday");
            return (Criteria) this;
        }

        public Criteria andBrithdayNotEqualTo(Date value) {
            addCriterionForJDBCDate("brithday <>", value, "brithday");
            return (Criteria) this;
        }

        public Criteria andBrithdayGreaterThan(Date value) {
            addCriterionForJDBCDate("brithday >", value, "brithday");
            return (Criteria) this;
        }

        public Criteria andBrithdayGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("brithday >=", value, "brithday");
            return (Criteria) this;
        }

        public Criteria andBrithdayLessThan(Date value) {
            addCriterionForJDBCDate("brithday <", value, "brithday");
            return (Criteria) this;
        }

        public Criteria andBrithdayLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("brithday <=", value, "brithday");
            return (Criteria) this;
        }

        public Criteria andBrithdayIn(List<Date> values) {
            addCriterionForJDBCDate("brithday in", values, "brithday");
            return (Criteria) this;
        }

        public Criteria andBrithdayNotIn(List<Date> values) {
            addCriterionForJDBCDate("brithday not in", values, "brithday");
            return (Criteria) this;
        }

        public Criteria andBrithdayBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("brithday between", value1, value2, "brithday");
            return (Criteria) this;
        }

        public Criteria andBrithdayNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("brithday not between", value1, value2, "brithday");
            return (Criteria) this;
        }

        public Criteria andPersionIdIsNull() {
            addCriterion("persion_id is null");
            return (Criteria) this;
        }

        public Criteria andPersionIdIsNotNull() {
            addCriterion("persion_id is not null");
            return (Criteria) this;
        }

        public Criteria andPersionIdEqualTo(String value) {
            addCriterion("persion_id =", value, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdNotEqualTo(String value) {
            addCriterion("persion_id <>", value, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdGreaterThan(String value) {
            addCriterion("persion_id >", value, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdGreaterThanOrEqualTo(String value) {
            addCriterion("persion_id >=", value, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdLessThan(String value) {
            addCriterion("persion_id <", value, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdLessThanOrEqualTo(String value) {
            addCriterion("persion_id <=", value, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdLike(String value) {
            addCriterion("persion_id like", value, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdNotLike(String value) {
            addCriterion("persion_id not like", value, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdIn(List<String> values) {
            addCriterion("persion_id in", values, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdNotIn(List<String> values) {
            addCriterion("persion_id not in", values, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdBetween(String value1, String value2) {
            addCriterion("persion_id between", value1, value2, "persionId");
            return (Criteria) this;
        }

        public Criteria andPersionIdNotBetween(String value1, String value2) {
            addCriterion("persion_id not between", value1, value2, "persionId");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceIsNull() {
            addCriterion("navite_place is null");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceIsNotNull() {
            addCriterion("navite_place is not null");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceEqualTo(String value) {
            addCriterion("navite_place =", value, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceNotEqualTo(String value) {
            addCriterion("navite_place <>", value, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceGreaterThan(String value) {
            addCriterion("navite_place >", value, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceGreaterThanOrEqualTo(String value) {
            addCriterion("navite_place >=", value, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceLessThan(String value) {
            addCriterion("navite_place <", value, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceLessThanOrEqualTo(String value) {
            addCriterion("navite_place <=", value, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceLike(String value) {
            addCriterion("navite_place like", value, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceNotLike(String value) {
            addCriterion("navite_place not like", value, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceIn(List<String> values) {
            addCriterion("navite_place in", values, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceNotIn(List<String> values) {
            addCriterion("navite_place not in", values, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceBetween(String value1, String value2) {
            addCriterion("navite_place between", value1, value2, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andNavitePlaceNotBetween(String value1, String value2) {
            addCriterion("navite_place not between", value1, value2, "navitePlace");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundIsNull() {
            addCriterion("edu_background is null");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundIsNotNull() {
            addCriterion("edu_background is not null");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundEqualTo(String value) {
            addCriterion("edu_background =", value, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundNotEqualTo(String value) {
            addCriterion("edu_background <>", value, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundGreaterThan(String value) {
            addCriterion("edu_background >", value, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundGreaterThanOrEqualTo(String value) {
            addCriterion("edu_background >=", value, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundLessThan(String value) {
            addCriterion("edu_background <", value, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundLessThanOrEqualTo(String value) {
            addCriterion("edu_background <=", value, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundLike(String value) {
            addCriterion("edu_background like", value, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundNotLike(String value) {
            addCriterion("edu_background not like", value, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundIn(List<String> values) {
            addCriterion("edu_background in", values, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundNotIn(List<String> values) {
            addCriterion("edu_background not in", values, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundBetween(String value1, String value2) {
            addCriterion("edu_background between", value1, value2, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andEduBackgroundNotBetween(String value1, String value2) {
            addCriterion("edu_background not between", value1, value2, "eduBackground");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andNatureIsNull() {
            addCriterion("nature is null");
            return (Criteria) this;
        }

        public Criteria andNatureIsNotNull() {
            addCriterion("nature is not null");
            return (Criteria) this;
        }

        public Criteria andNatureEqualTo(Integer value) {
            addCriterion("nature =", value, "nature");
            return (Criteria) this;
        }

        public Criteria andNatureNotEqualTo(Integer value) {
            addCriterion("nature <>", value, "nature");
            return (Criteria) this;
        }

        public Criteria andNatureGreaterThan(Integer value) {
            addCriterion("nature >", value, "nature");
            return (Criteria) this;
        }

        public Criteria andNatureGreaterThanOrEqualTo(Integer value) {
            addCriterion("nature >=", value, "nature");
            return (Criteria) this;
        }

        public Criteria andNatureLessThan(Integer value) {
            addCriterion("nature <", value, "nature");
            return (Criteria) this;
        }

        public Criteria andNatureLessThanOrEqualTo(Integer value) {
            addCriterion("nature <=", value, "nature");
            return (Criteria) this;
        }

        public Criteria andNatureIn(List<Integer> values) {
            addCriterion("nature in", values, "nature");
            return (Criteria) this;
        }

        public Criteria andNatureNotIn(List<Integer> values) {
            addCriterion("nature not in", values, "nature");
            return (Criteria) this;
        }

        public Criteria andNatureBetween(Integer value1, Integer value2) {
            addCriterion("nature between", value1, value2, "nature");
            return (Criteria) this;
        }

        public Criteria andNatureNotBetween(Integer value1, Integer value2) {
            addCriterion("nature not between", value1, value2, "nature");
            return (Criteria) this;
        }

        public Criteria andEntryDayIsNull() {
            addCriterion("entry_day is null");
            return (Criteria) this;
        }

        public Criteria andEntryDayIsNotNull() {
            addCriterion("entry_day is not null");
            return (Criteria) this;
        }

        public Criteria andEntryDayEqualTo(Date value) {
            addCriterionForJDBCDate("entry_day =", value, "entryDay");
            return (Criteria) this;
        }

        public Criteria andEntryDayNotEqualTo(Date value) {
            addCriterionForJDBCDate("entry_day <>", value, "entryDay");
            return (Criteria) this;
        }

        public Criteria andEntryDayGreaterThan(Date value) {
            addCriterionForJDBCDate("entry_day >", value, "entryDay");
            return (Criteria) this;
        }

        public Criteria andEntryDayGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("entry_day >=", value, "entryDay");
            return (Criteria) this;
        }

        public Criteria andEntryDayLessThan(Date value) {
            addCriterionForJDBCDate("entry_day <", value, "entryDay");
            return (Criteria) this;
        }

        public Criteria andEntryDayLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("entry_day <=", value, "entryDay");
            return (Criteria) this;
        }

        public Criteria andEntryDayIn(List<Date> values) {
            addCriterionForJDBCDate("entry_day in", values, "entryDay");
            return (Criteria) this;
        }

        public Criteria andEntryDayNotIn(List<Date> values) {
            addCriterionForJDBCDate("entry_day not in", values, "entryDay");
            return (Criteria) this;
        }

        public Criteria andEntryDayBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("entry_day between", value1, value2, "entryDay");
            return (Criteria) this;
        }

        public Criteria andEntryDayNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("entry_day not between", value1, value2, "entryDay");
            return (Criteria) this;
        }

        public Criteria andPostIdIsNull() {
            addCriterion("post_id is null");
            return (Criteria) this;
        }

        public Criteria andPostIdIsNotNull() {
            addCriterion("post_id is not null");
            return (Criteria) this;
        }

        public Criteria andPostIdEqualTo(Integer value) {
            addCriterion("post_id =", value, "postId");
            return (Criteria) this;
        }

        public Criteria andPostIdNotEqualTo(Integer value) {
            addCriterion("post_id <>", value, "postId");
            return (Criteria) this;
        }

        public Criteria andPostIdGreaterThan(Integer value) {
            addCriterion("post_id >", value, "postId");
            return (Criteria) this;
        }

        public Criteria andPostIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("post_id >=", value, "postId");
            return (Criteria) this;
        }

        public Criteria andPostIdLessThan(Integer value) {
            addCriterion("post_id <", value, "postId");
            return (Criteria) this;
        }

        public Criteria andPostIdLessThanOrEqualTo(Integer value) {
            addCriterion("post_id <=", value, "postId");
            return (Criteria) this;
        }

        public Criteria andPostIdIn(List<Integer> values) {
            addCriterion("post_id in", values, "postId");
            return (Criteria) this;
        }

        public Criteria andPostIdNotIn(List<Integer> values) {
            addCriterion("post_id not in", values, "postId");
            return (Criteria) this;
        }

        public Criteria andPostIdBetween(Integer value1, Integer value2) {
            addCriterion("post_id between", value1, value2, "postId");
            return (Criteria) this;
        }

        public Criteria andPostIdNotBetween(Integer value1, Integer value2) {
            addCriterion("post_id not between", value1, value2, "postId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdIsNull() {
            addCriterion("kindergarten_id is null");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdIsNotNull() {
            addCriterion("kindergarten_id is not null");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdEqualTo(Integer value) {
            addCriterion("kindergarten_id =", value, "kindergartenId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdNotEqualTo(Integer value) {
            addCriterion("kindergarten_id <>", value, "kindergartenId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdGreaterThan(Integer value) {
            addCriterion("kindergarten_id >", value, "kindergartenId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("kindergarten_id >=", value, "kindergartenId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdLessThan(Integer value) {
            addCriterion("kindergarten_id <", value, "kindergartenId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdLessThanOrEqualTo(Integer value) {
            addCriterion("kindergarten_id <=", value, "kindergartenId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdIn(List<Integer> values) {
            addCriterion("kindergarten_id in", values, "kindergartenId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdNotIn(List<Integer> values) {
            addCriterion("kindergarten_id not in", values, "kindergartenId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdBetween(Integer value1, Integer value2) {
            addCriterion("kindergarten_id between", value1, value2, "kindergartenId");
            return (Criteria) this;
        }

        public Criteria andKindergartenIdNotBetween(Integer value1, Integer value2) {
            addCriterion("kindergarten_id not between", value1, value2, "kindergartenId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}