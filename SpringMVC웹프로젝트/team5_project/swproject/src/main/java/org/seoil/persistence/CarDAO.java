package org.seoil.persistence;

import java.util.List;

import org.seoil.domain.Criteria;
import org.seoil.domain.RentVO;
import org.seoil.domain.SearchCriteria;
import org.seoil.domain.UsedVO;

public interface CarDAO {
	
	
	public List<RentVO> rentSearch(SearchCriteria cri) throws Exception; // 렌트차량 검색 
	public int rentSearchCount(SearchCriteria cri) throws Exception; // 렌트차량 검색 페이징
	
	public List<UsedVO> usedSearch(SearchCriteria cri) throws Exception; // 중고차량 검색 
	public int usedSearchCount(SearchCriteria cri) throws Exception; // 중고차량 검색 페이징
	
	public List<RentVO> rentmain() throws Exception; // 메인화면 렌트차량 목록
	public List<UsedVO> usedmain() throws Exception; // 메인화면 중고차량 목록

	public void rentcreate(RentVO vo) throws Exception; // 렌트차 정보 등록
	public void usedcreate(UsedVO vo) throws Exception; // 중고차 정보 등록
	
	public List<UsedVO> usedlistAll()throws Exception; // 중고차량 목록 보여주기
	public List<RentVO> rentlistAll()throws Exception; // 렌트차량 목록 보여주기
	
	public UsedVO usedread(Integer no) throws Exception; // 중고차량 정보 보여주기
	public void useddelete(Integer no) throws Exception; // 중고차량 정보 삭제
	public void usedupdate(UsedVO vo) throws Exception; // 중고차량 정보 수정

	public RentVO rentread(Integer no) throws Exception; // 렌트차량 정보 불러오기
	public void rentdelete(Integer no) throws Exception; // 렌트차량 정보 삭제
	public void rentupdate(RentVO vo) throws Exception; // 렌트차량 정보 수정
	

	public List<UsedVO> usedCriteria(Criteria cri) throws Exception; // 중고차량 전체 목록 페이징
	public int ucountPageing(Criteria cri) throws Exception; // 중고차량 전체 게시물 수

	//public List<UsedVO> umyCriteria(Integer no) throws Exception; // 나의 중고차량 목록 페이징
	//public int umycountPageing(Integer no) throws Exception; // 나의 중고차량 게시물 수
	
	
	public List<RentVO> rentCriteria(Criteria cri) throws Exception; // 렌트차량 페이징
	public int rcountPageing(Criteria cri) throws Exception; // 렌트차량 페이징

	
	public void usedAttach(String fullName) throws Exception; // 중고차량 사진저장
	public void rentAttach(String fullName) throws Exception; // 렌트차량 사진저장
	
	
	public List<String> usedgetAttach(Integer no)throws Exception; // 중고차량 이미지 불러오기
	public List<String> rentgetAttach(Integer no)throws Exception; // 렌트차량 이미지 불러오기
	
	
	
	public List<UsedVO> musedlist()throws Exception; // 메인화면 중고차량 보여주기
	public List<RentVO> mrentlist()throws Exception; // 메인화면 렌트차량 보여주기
	
	
	public void rentAttachdel(Integer no) throws Exception; // 렌트차량 게시물 삭제
	public void rentreplaceAttach(String fullName, Integer no) throws Exception; //  렌트차량 게시물 수정
	
	public void usedAttachdel(Integer no) throws Exception; // 중차량 게시물 삭제
	public void usedreplaceAttach(String fullName, Integer no) throws Exception; //  중고차량 게시물 수정
	
}
