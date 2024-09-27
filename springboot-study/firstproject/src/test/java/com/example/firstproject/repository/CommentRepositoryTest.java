package com.example.firstproject.repository;

import com.example.firstproject.models.entity.Article;
import com.example.firstproject.entity.Comment;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest    //  JPA 관련된 설정만 로드하여 테스트
class CommentRepositoryTest {
    @Autowired
    CommentRepository commentRepository;

    @Test
    @DisplayName("특정 게시글의 모든 댓글 조회")
    void findByArticleId() {
        // 실제 테스트 코드 작성
        /* Case 1: 4번 게시글의 모든 댓글 조회 */
        {
            // 1. 준비 데이터
            Long articleId = 4L;
            // 2. 실제 데이터
            List<Comment> commentList = commentRepository.findByArticleId(articleId);
            // 3. 예상 데이터
            Article article = new Article(articleId, "당신의 인생 영화는", "댓글 고");

            Comment a = new Comment(1L, "Park", "굿 윌 헌팅", article);
            Comment b = new Comment(2L, "Kim", "아이 엠 샘", article);
            Comment c = new Comment(3L, "Choi", "쇼생크 탈출", article);
            List<Comment> expected = Arrays.asList(a, b, c);
            // 4. 비교 및 검증
            assertEquals(expected.toString(), commentList.toString());
        }
        /* Case 2: 1번 게시글의 모든 댓글 조회 */
        {
            // 1. 준비 데이터
            Long articleId = 1L;
            // 2. 실제 데이터
            List<Comment> commentList = commentRepository.findByArticleId(articleId);
            // 3. 예상 데이터
            Article article = new Article(articleId, "가가가가", "1111");
            List<Comment> expected = Arrays.asList();
            // 4. 비교 및 검증
            assertEquals(expected.toString(), commentList.toString(), "1번 글은 댓글이 없음");
        }
    }

    @Test
    @DisplayName("특정 닉네님의 모든 댓글 조회")
    void findByNickname() {
        // 실제 테스트 코드 작성
        /* Case 1: "Park"의 모든 댓글 조회 */
        {
            // 1. 준비 데이터
            String nickname = "Park";
            // 2. 실제 데이터
            List<Comment> commentList = commentRepository.findByNickname(nickname);
            // 3. 예상 데이터
            Comment a = new Comment(1L, nickname, "굿 윌 헌팅", new Article(4L, "당신의 인생 영화는", "댓글 고"));
            Comment b = new Comment(4L, nickname, "치킨", new Article(5L, "당신의 소울 푸드는", "댓글 고고"));
            Comment c = new Comment(7L, nickname, "조깅", new Article(6L, "당신의 취미는", "댓글 고고고"));
            List<Comment> expected = Arrays.asList(a, b, c);
            // 4. 비교 및 검증
            assertEquals(expected.toString(), commentList.toString(), "Park의 모든 댓글을 출력");
        }
    }

    @Test
    @DisplayName("9번 게시글의 모든 댓글 조회")
    void findByArticleNineId() {
        // 1. 준비 데이터
        Long articleId = 9L;
        // 2. 실제 데이터
        List<Comment> commentList = commentRepository.findByArticleId(articleId);
        // 3. 예상 데이터
        List<Comment> expected = new ArrayList<>();
        // 4. 비교 및 검증
        assertEquals(expected, commentList, "9번 게시글이 존재하지 않음");
    }

    @Test
    @DisplayName("999번 게시글의 모든 댓글 조회")
    void findByArticle999Id() {
        // 1. 준비 데이터
        Long articleId = 999L;
        // 2. 실제 데이터
        List<Comment> commentList = commentRepository.findByArticleId(articleId);
        // 3. 예상 데이터
        List<Comment> expected = new ArrayList<>();
        // 4. 비교 및 검증
        assertEquals(expected, commentList, "999번 게시글이 존재하지 않음");
    }

    @Test
    @DisplayName("-1번 게시글의 모든 댓글 조회")
    void findByArticleSubtractOneId() {
        // 1. 준비 데이터
        Long articleId = 1L;
        // 2. 실제 데이터
        List<Comment> commentList = commentRepository.findByArticleId(articleId);
        // 3. 예상 데이터
        List<Comment> expected = Arrays.asList();
        // 4. 비교 및 검증
        assertEquals(expected, commentList, "-1번 게시글이 존재하지 않음");
    }

    @Test
    @DisplayName("Kim의 모든 댓글 조회")
    void findByNicknameKim() {
        // 1. 준비 데이터
        String nickname = "Kim";
        // 2. 실제 데이터
        List<Comment> commentList = commentRepository.findByNickname(nickname);
        // 3. 예상 데이터
        Comment a = new Comment(2L, "Kim", "아이 엠 샘", new Article(4L, "당신의 인생 영화는", "댓글 고"));
        Comment b = new Comment(5L, "Kim", "샤브샤브", new Article(5L, "당신의 소울 푸드는", "댓글 고고"));
        Comment c = new Comment(8L, "Kim", "유투브 시청", new Article(6L, "당신의 취미는", "댓글 고고고"));
        List<Comment> expected = Arrays.asList(a, b, c);
        // 4. 비교 및 검증
        assertEquals(expected.toString(), commentList.toString());
    }

    @Test
    @DisplayName("null의 모든 댓글 조회")
    void findByNicknameNull() {
        // 1. 준비 데이터
        String nickname = "null";
        // 2. 실제 데이터
        List<Comment> commentList = commentRepository.findByNickname(nickname);
        // 3. 예상 데이터
       List<Comment> expected = Arrays.asList();
        // 4. 비교 및 검증
       assertEquals(expected, commentList, "닉네임이 없는 댓글은 존재하지 않음");
    }

    @Test
    @DisplayName("\"\" 의 모든 댓글 조회")
    void findByNicknameNone() {
        // 1. 준비 데이터
        String nickname = "";
        // 2. 실제 데이터
        List<Comment> commentList = commentRepository.findByNickname(nickname);
        // 3. 예상 데이터
        List<Comment> expected = Arrays.asList();
        // 4. 비교 및 검증
        assertEquals(expected, commentList, "닉네임이 없는 댓글은 존재하지 않음");
    }
}