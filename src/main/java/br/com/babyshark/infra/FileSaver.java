
package br.com.babyshark.infra;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;

import br.com.babyshark.entity.Photo;

@Component
public class FileSaver {

	@Autowired
	private AmazonS3 amazonS3;
	private static final String BUCKET = "imagens-donates";

	public String write(MultipartFile file) {
		try {
			amazonS3.putObject(new PutObjectRequest(BUCKET, file.getOriginalFilename(), file.getInputStream(), null)
					.withCannedAcl(CannedAccessControlList.PublicRead));
			return "http://s3.amazonaws.com/" + BUCKET + "/" + file.getOriginalFilename();

		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e);
		}
	}

	public void delete(List<Photo> url) {
		try {

			for (Photo photo : url) {
				String photoPath = photo.getPath();
				photoPath = photoPath.replace("http://s3.amazonaws.com/imagens-donates/", "");
				amazonS3.deleteObject(new DeleteObjectRequest(BUCKET, photoPath));
			}

		} catch (IllegalStateException e) {
			throw new RuntimeException(e);
		}
	}

}
