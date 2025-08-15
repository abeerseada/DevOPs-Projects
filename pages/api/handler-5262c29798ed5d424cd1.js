export default function handler(req, res) {
  res.status(200).json({
    message: "5262c29798ed5d424cd1",
    timestamp: new Date().toISOString(),
  });
}